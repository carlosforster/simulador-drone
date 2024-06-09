import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWebEngine import QtWebEngine

if __name__ == '__main__':
    QtWebEngine.initialize()
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load('simulador.qml')

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
