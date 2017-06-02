import QtQuick 2.8
import QtQuick.Window 2.2


Window {
    id: win; width: 200; height: 200;

    Rectangle {
        id: rect; width: 100; height: 100; color: 'blue';

        transform: [
            Scale {
                id: scale; xScale: yScale;
                yScale: Math.min(
                    win.width/rect.width,
                    win.height/rect.height);},
            Translate {
                x: (win.width-rect.width*scale.xScale)/2;
                y: (win.height-rect.height*scale.yScale)/2;}]

        Rectangle {
            x: 0; y: 0; width: 50; height: 50; color: 'red';
        }
    }
}
