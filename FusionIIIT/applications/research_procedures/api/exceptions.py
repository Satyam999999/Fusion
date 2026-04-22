import logging

from rest_framework import status
from rest_framework.views import exception_handler as drf_exception_handler


logger = logging.getLogger(__name__)


def rspc_exception_handler(exc, context):
    """Normalize DRF errors and avoid leaking internals in API responses."""
    response = drf_exception_handler(exc, context)

    if response is None:
        logger.exception(
            "Unhandled API exception",
            extra={
                "view": context.get("view").__class__.__name__ if context.get("view") else None,
                "path": context.get("request").path if context.get("request") else None,
            },
        )
        return None

    detail = response.data
    message = "Request failed"
    if isinstance(detail, dict):
        if "detail" in detail and detail["detail"]:
            message = str(detail["detail"])
        elif "error" in detail and detail["error"]:
            message = str(detail["error"])
    elif isinstance(detail, list) and detail:
        message = str(detail[0])
    elif detail:
        message = str(detail)

    code = "api_error"
    if response.status_code == status.HTTP_400_BAD_REQUEST:
        code = "bad_request"
    elif response.status_code == status.HTTP_401_UNAUTHORIZED:
        code = "unauthorized"
    elif response.status_code == status.HTTP_403_FORBIDDEN:
        code = "forbidden"
    elif response.status_code == status.HTTP_404_NOT_FOUND:
        code = "not_found"
    elif response.status_code >= 500:
        code = "server_error"

    response.data = {
        "error": message,
        "code": code,
        "details": detail,
    }
    return response
