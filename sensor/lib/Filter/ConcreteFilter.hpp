#pragma once
#include "Filter.hpp"

template <typename T>
class MovingAverage : Filter<T> {
    private:
        int window;

    public:
        float getFiltered(T data[]);
        int getWindow();
        MovingAverage(int window);
        MovingAverage operator()(int window);
};
