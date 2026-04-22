import logging
import time


logger = logging.getLogger(__name__)


class RSPCResponseTimingMiddleware:
    """Adds lightweight response-time headers and slow-request logging."""

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        start = time.perf_counter()
        response = self.get_response(request)
        elapsed_ms = (time.perf_counter() - start) * 1000

        if request.path.startswith('/research_procedures/api/'):
            response['X-Response-Time-ms'] = f"{elapsed_ms:.2f}"
            if elapsed_ms > 500:
                logger.warning(
                    "Slow RSPC API request",
                    extra={
                        "path": request.path,
                        "method": request.method,
                        "duration_ms": round(elapsed_ms, 2),
                        "user": request.user.username if getattr(request, 'user', None) and request.user.is_authenticated else 'anonymous',
                    },
                )

        return response
