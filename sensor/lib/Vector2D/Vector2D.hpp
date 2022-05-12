#pragma once
#include "math.h"

class Vector2D {
    public:
        float x, y;
        Vector2D(float x = 0., float y = 0.);

        Vector2D operator+(const Vector2D& w);

        Vector2D& operator+=(const Vector2D& w);

        Vector2D operator-(const Vector2D& w);

        Vector2D& operator-=(const Vector2D& w);

        Vector2D operator-();

        Vector2D operator*(const Vector2D& w);

        Vector2D operator/(const Vector2D& w);

        float magnitude();
};

// not a real factory, but works anyway
namespace factory_vector {
    Vector2D create_i();
    Vector2D create_j();
}
