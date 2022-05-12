#include "process.hpp"

namespace process {
    MovingAverage<int> ldrFilter(10);

    SensorLDR ldrLeft(
        &ldrFilter,
        27
    );

    SensorLDR ldrFront(
        &ldrFilter,
        26
    );

    SensorLDR ldrRight(
        &ldrFilter,
        25
    );

    SensorLDR ldrBack(
        &ldrFilter,
        33
    );

    void ldrReadData() {
        ldrRight.read();
        ldrFront.read();
        ldrBack.read();
        ldrLeft.read();
    }

    Vector2D calculateIntent() {
        Vector2D i = factory_vector::create_i();
        Vector2D j = factory_vector::create_j();

        float max_input = 4095;

        // TODO: normalized to unit vector
        float right = ldrRight.getData();
        float left = ldrLeft.getData();
        float front = ldrFront.getData();
        float back = ldrBack.getData();

        return (i*right - i*left + j*front - j*back)/max_input; 
    }

    void main() {
        ldrReadData();
        Vector2D intent = calculateIntent();
        communication::sendMessage(intent);
    }
}
