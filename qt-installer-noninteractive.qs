// Emacs mode hint: -*- mode: JavaScript -*-
// https://bitbucket.org/xiannox/trusty-qt5.7-beta-x64/raw/HEAD/qt-installer-noninteractive.qs
// https://bitbucket.org/xiannox/trusty-qt5.7-beta-x64

function Controller() {
console.log("controller");
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
console.log("WelcomePageCallback");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.CredentialsPageCallback = function() {
console.log("CredentialsPageCallback");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
console.log("IntroductionPageCallback");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
console.log("TargetDirectoryPageCallback");
    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/qt");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
console.log("ComponentSelectionPageCallback");
    var widget = gui.currentPageWidget();

    widget.deselectAll();
    widget.selectComponent("qt.593.gcc_64");
    // http://code.qt.io/cgit/qtsdk/qtsdk.git/tree/packaging-tools/configurations/pkg_templates/pkg_593
    widget.selectComponent("qt.593.clang_64");
    widget.selectComponent("qt.593.android_armv7");
    widget.selectComponent("qt.593.qtvirtualkeyboard");
    widget.selectComponent("qt.593.qtwebengine");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
console.log("LicenseAgreementPageCallback");
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
console.log("StartMenuDirectoryPageCallback");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
console.log("ReadyForInstallationPageCallback");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
console.log("FinishedPageCallback");
    var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm    
    if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
        checkBoxForm.launchQtCreatorCheckBox.checked = false;
    }
    gui.clickButton(buttons.FinishButton);
}
