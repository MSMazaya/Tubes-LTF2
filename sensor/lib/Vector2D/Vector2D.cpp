#include "Vector2D.hpp"

Vector2D::Vector2D(float x, float y) {
    x = x;
    y = y;
}

Vector2D inline Vector2D::operator+ (const Vector2D& w) {
    return Vector2D(x + w.x, y + w.y);
}

Vector2D inline Vector2D::operator-(const Vector2D& w) {
    return Vector2D(x - w.x, y - w.y);
}

Vector2D inline Vector2D::operator-() {
    return Vector2D(- x, - y);
}

float Vector2D::magnitude() {
    return sqrt(x*x + y*y);
}
