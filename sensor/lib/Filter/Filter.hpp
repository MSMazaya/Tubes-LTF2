#pragma once

template <typename T>
class Filter {
    private:
        int window;

    public:
        virtual float getFiltered(T data[]);
        int getWindow();
        Filter(int window);
        Filter operator()(int window);
};
