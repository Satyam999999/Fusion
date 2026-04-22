from datetime import datetime, date

from rest_framework import serializers


def normalize_flexible_date(value):
    if isinstance(value, date):
        return value
    if not isinstance(value, str):
        return value

    normalized = value.strip().replace("Sept.", "Sep").replace("Sept", "Sep")
    formats = [
        "%Y-%m-%d",
        "%d-%m-%Y",
        "%d/%m/%Y",
        "%d %b %Y",
        "%d %B %Y",
        "%b %d, %Y",
        "%B %d, %Y",
    ]
    for fmt in formats:
        try:
            return datetime.strptime(normalized, fmt).date()
        except ValueError:
            continue
    return value


def parse_date_fields(attrs, date_fields):
    errors = {}
    for field_name in date_fields:
        value = attrs.get(field_name)
        if isinstance(value, str):
            parsed = normalize_flexible_date(value)
            if isinstance(parsed, str):
                errors[field_name] = "Unsupported date format."
                continue
            attrs[field_name] = parsed

    if errors:
        raise serializers.ValidationError(errors)

    return attrs


def add_date_order_error(errors, earlier_value, later_value, field_name, message):
    if earlier_value and later_value and later_value < earlier_value:
        errors[field_name] = message
