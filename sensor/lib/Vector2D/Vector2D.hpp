#pragma once
#include "math.h"

class Vector2D {
    private:
        float x, y;

    public:
        Vector2D(float x = 0., float y = 0.);

        inline Vector2D operator+(const Vector2D& w);

        inline Vector2D operator-(const Vector2D& w);

        inline Vector2D operator-() ;

        float magnitude();
};
