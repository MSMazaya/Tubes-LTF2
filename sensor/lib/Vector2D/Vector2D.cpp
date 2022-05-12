#include "Vector2D.hpp"

Vector2D::Vector2D(float x_, float y_) {
    x = x_;
    y = y_;
}

Vector2D Vector2D::operator+ (const Vector2D& w) {
    return Vector2D(x + w.x, y + w.y);
}

Vector2D& Vector2D::operator+=(const Vector2D& w) {
    this->x += w.x;
    this->y += w.y;
    return *this;
}

Vector2D Vector2D::operator-(const Vector2D& w) {
    return Vector2D(x - w.x, y - w.y);
}

Vector2D& Vector2D::operator-=(const Vector2D& w) {
    this->x -= w.x;
    this->y -= w.y;
    return *this;
}

Vector2D Vector2D::operator-() {
    return Vector2D(- x, - y);
}

Vector2D Vector2D::operator*(const Vector2D& w) {
    return Vector2D(x * w.x, y * w.y);
}

Vector2D Vector2D::operator/(const Vector2D& w) {
    return Vector2D(x / w.x, y / w.y);
}

float Vector2D::magnitude() {
    return sqrt(x*x + y*y);
}

namespace factory_vector {
    Vector2D create_i(){
        return Vector2D(
            1,
            0
        );
    }
    Vector2D create_j(){
        return Vector2D(
            0,
            1
        );
    }
}
