#include "Vector2D.hpp"

Vector2D::Vector2D(float x_, float y_) {
    x = x_;
    y = y_;
}

Vector2D Vector2D::operator+ (const Vector2D& w) {
    return Vector2D(x + w.x, y + w.y);
}

Vector2D Vector2D::operator+=(const Vector2D& w) {
    return Vector2D(x + w.x, y + w.y);
}

Vector2D Vector2D::operator-(const Vector2D& w) {
    return Vector2D(x - w.x, y - w.y);
}

Vector2D Vector2D::operator-() {
    return Vector2D(- x, - y);
}

float Vector2D::magnitude() {
    return sqrt(x*x + y*y);
}
