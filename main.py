import os
from pathlib import Path
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import resource.rc_resources    # type: ignore

from src.symbolicLinkManager import SymbolicLinkManager


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    symbolicLinkManager = SymbolicLinkManager()
    context = engine.rootContext()
    context.setContextProperty("symbolicLinkManager", symbolicLinkManager)

    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
    pass
