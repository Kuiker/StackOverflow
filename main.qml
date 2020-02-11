/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

import MyApplication 1.0


Rectangle {
    id: window
    width: 360
    height: 520
    color: "#00000000"
    visible: true
    objectName: 'rectangle'

    NavigationDrawer {
        id: nav
        objectName: 'navDrawer'

        Rectangle {
            color: "#00c6fb"
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#22e1ff"
                }

                GradientStop {
                    position: 0.48
                    color: "#1d8fe1"
                }

                GradientStop {
                    position: 1
                    color: "#625eb1"
                }
            }
            anchors.fill: parent

            ListView {
                anchors.fill: parent
                model: navModel
                delegate: Item {
                    height: nav.dp(48)
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: nav.dp(5)
                        color: "#4facfe"
                        gradient: Gradient {
                            GradientStop {
                                position: 0
                                color: "#4facfe"
                            }

                            GradientStop {
                                position: 1
                                color: "#00f2fe"
                            }
                        }

                        Text {
                            text: fragment
                            anchors.fill: parent
                            font.pixelSize: nav.dp(20)

                            renderType: Text.NativeRendering
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                // Load any qml page
                                QDrawer.log("debug", "Button click event detected")
                                QDrawer.close()
                            }
                        }
                    }
                }


            }
        }
    }

    ListModel {
            id: navModel
            objectName: 'drawer_list'

            ListElement {fragment: "Fragment 1"}
            ListElement {fragment: "Fragment 2"}
            ListElement {fragment: "Fragment 3"}
        }

    QPythonBinding{
    id: binding
    signal addElement(string param1)
        onAddElement: {
            QDrawer.log("debug", "Emitted signal received. Adding " + param1 + " to drawer model" )
            navModel.append({"fragment" : param1})
        }
    }
}


