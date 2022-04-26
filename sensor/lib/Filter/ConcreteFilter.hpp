#pragma once
#include "Filter.hpp"

template <typename T>
class MovingAverage : public Filter<T> {
    private:
        int window;

    public:
        virtual float getFiltered(T data[]) override {
            float average = 0;
            for(int i=0;i<window;i++) {
                average+=data[i];
            }
            return average/window;
        };
        virtual int getWindow() override {
            return window;
        };
        MovingAverage(int window_input){
            window = window_input;
        }
};
