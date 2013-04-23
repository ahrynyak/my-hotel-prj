/* Copyright © 2005 - 2009 Annpoint, s.r.o.
Use of this software is subject to license terms. 
http://www.daypilot.org/

If you have purchased a DayPilot Pro license, you are allowed to use this 
code under the conditions of DayPilot Pro License Agreement:

http://www.daypilot.org/files/LicenseAgreement.pdf

Otherwise, you are allowed to use it for evaluation purposes only under 
the conditions of DayPilot Pro Trial License Agreement:
   
http://www.daypilot.org/files/LicenseAgreementTrial.pdf
   
*/

if (typeof (DayPilot2) === 'undefined') {
    DayPilot2 = {};
}

DayPilot2.Message = function (id) {

    // default values
    this.hideAfter = 4000; // ms

    var This = this;
    this.id = id;

    this.show = function (html, className) {
        if (html == null) {
            return;
        }

        this.div = document.getElementById(id);

        this.div.innerHTML = html;
        this.div.style.display = '';
        if (className) {
            this.oldClassName = this.div.className;
            this.div.className = className;
        }

        if (this.timeout) {
            window.clearTimeout(this.timeout);
        }

        var delayedHide = function () { This.hide(); };

        this.timeout = window.setTimeout(delayedHide, this.hideAfter);

    };

    this.hide = function () {
        this.div.innerHTML = '';
        this.div.style.display = 'none';
        if (this.oldClassName) {
            this.div.className = this.oldClassName;
            this.oldClassName = null;
        }
    };
};
