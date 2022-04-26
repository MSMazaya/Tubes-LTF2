#pragma once

template <typename T>
class Filter {
    private:
        int window;

    public:
        virtual float getFiltered(T data[]) = 0;
        virtual int getWindow() = 0;
};
