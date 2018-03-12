function Dialog(name) {
	this._name = name;
	this.__owner = null;
	this.__win = null;
	this._callback = null;
	this.returnValue = null;
}

Dialog._instances = new Object();

Dialog.create = function(name) {
	this._instances[name] = new Dialog(name);
	return this._instances[name];
};

Dialog.getInstance = function(name) {
	return this._instances[name];
};

Dialog.prototype.show = function(url,callback,width,height) {
    this._callback = callback;
    var uri = url;
    
    uri += (url.indexOf("?")==-1)?"?":"&";
    
    uri+= "__dlgid=" + new Date().valueOf();
    //uri+="&Callback=" + (callback ? callback : "");
    //var feat = "scroll:no, resizable:yes, status:no, windowheight:250px, windowwidth: 600px,dialog";
    width = width?width:300;
    height = height?height:400;
    var feat = "toolbar=0,location=0,directories=0,status=0,menubar=0, height="+height+", width="+width+", dialog, modal";
    this.__win = window.open(uri, "__dialog", feat);
    this.__win.owner = this;
    var scrWidth = window.screen.width ;
	var scrHeight = window.screen.height;
	this.__win.moveTo((scrWidth-width)/2,(scrHeight-height)/2);

    this.__owner = self;
};

Dialog.prototype.close = function(value) {
	if(value)
    	this.returnValue = value;

    try {
    	this.__win.close();
    }catch(e) {}
    this.__win = null;
    this.__owner = null;

    if (this._callback) {
    	this._callback(this);
    }
};

//对FormBean方法进行提交。
function submitForm(formName,method,validate) {
	var theForm = null;
	if(typeof(formName)=="string") {
		theForm = document.forms[formName];
	} else {
		theForm = formName;
		formName = theForm.name;
	}
	if(theForm==null) {
		alert("can't find ["+formName+"] object");
		return;
	}
	var result = true;
	if(validate) {
		var fnName = "validate"+formName.substring(0,1).toUpperCase()+formName.substring(1);
		var tempFn = null;
		try {
			tempFn=eval(fnName);
		} catch(ex) {
		}
		if(typeof(tempFn)=="function") {
			result = tempFn(theForm);
		}
	}
	if(result) {
		if(method) {
			theForm.elements["method"].value = method;
		}
		theForm.submit();
	}
}

function confirmSubmitForm(formName,msg,action,validate) {
	if(window.confirm(msg)) {
		submitForm(formName,action,validate);
	}
}

if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (obj, fromIndex) {
        if (fromIndex == null) {
            fromIndex = 0;
        } else if (fromIndex < 0) {
            fromIndex = Math.max(0, this.length + fromIndex);
        }
        for (var i = fromIndex; i < this.length; i++) {
            if (this[i] === obj)
                return i;
        }
        return -1;
    };
}


if (!Array.prototype.lastIndexOf) {
    Array.prototype.lastIndexOf = function (obj, fromIndex) {
        if (fromIndex == null) {
            fromIndex = this.length - 1;
        } else if (fromIndex < 0) {
            fromIndex = Math.max(0, this.length + fromIndex);
        }
        for (var i = fromIndex; i >= 0; i--) {
            if (this[i] === obj)
                return i;
        }
        return -1;
    };
}


if (!Array.prototype.forEach) {
    Array.prototype.forEach = function(fun /*, thisp*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this) {
                fun.call(thisp, this[i], i, this);
            }
        }
    };
}


if (!Array.prototype.filter) {
    Array.prototype.filter = function(fun) {
        var len = this.length;
        if (typeof fun != "function") {
          throw new TypeError();
        }
        var res   = [];
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this) {
                var val = this[i]; // in case fun mutates this
                if (fun.call(thisp, val, i, this)) {
                    res.push(val);
                }
            }
        }
        return res;
    };
}


if (!Array.prototype.map) {
    Array.prototype.map = function(fun /*, thisp*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }
        var res   = new Array(len);
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this) {
                res[i] = fun.call(thisp, this[i], i, this);
            }
        }
        return res;
    };
}


if (!Array.prototype.some) {
    Array.prototype.some = function(fun /*, thisp*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }

        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this && fun.call(thisp, this[i], i, this)) {
                return true;
            }
        }

        return false;
    };
}


if (!Array.prototype.every) {
    Array.prototype.every = function(fun) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this && !fun.call(thisp, this[i], i, this)) {
                return false;
            }
        }
        return true;
    };
}


if (!Array.prototype.reduce) {
    Array.prototype.reduce = function(fun /*, initial*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }
        // no value to return if no initial value and an empty array
        if (len == 0 && arguments.length == 1) {
          throw new TypeError();
        }

        var i = 0;
        if (arguments.length >= 2) {
            var rv = arguments[1];
        } else {
          do {
                if (i in this) {
                    rv = this[i++];
                    break;
                }
                // if array contains no values, no initial value to return
                if (++i >= len) {
                  throw new TypeError();
                }
          } while (true);
        }

        for (; i < len; i++) {
            if (i in this) {
                rv = fun.call(null, rv, this[i], i, this);
            }
        }

        return rv;
    };
}


if (!Array.prototype.reduceRight) {
    Array.prototype.reduceRight = function(fun /*, initial*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }

        // no value to return if no initial value, empty array
        if (len == 0 && arguments.length == 1) {
            throw new TypeError();
        }

        var i = len - 1;
        if (arguments.length >= 2) {
            var rv = arguments[1];
        } else {
            do {
                if (i in this) {
                    rv = this[i--];
                    break;
                }

                // if array contains no values, no initial value to return
                if (--i < 0) {
                  throw new TypeError();
                }
            } while (true);
        }

        for (; i >= 0; i--) {
            if (i in this) {
                rv = fun.call(null, rv, this[i], i, this);
            }
        }

        return rv;
    };
}


if (!Array.prototype.unique) {
    Array.prototype.unique = function() {
        var resultArr = [],
            returnArr = [],
            origLen = this.length,
            resultLen;

        function include(arr, value) {
            for (var i = 0, n = arr.length; i < n; ++i){
                if (arr[i] === value) {
                    return true;
                }
            }

            return false;
        }

        resultArr.push(this[0]);
        for (var i = 1; i < origLen; ++i) {
            if (include(resultArr, this[i])) {
                returnArr.push(this[i]);
            } else {
                resultArr.push(this[i]);
            }
        }

        resultLen = resultArr.length;
        this.length = resultLen;
        for (var i = 0; i < resultLen; ++i){
            this[i] = resultArr[i];
        }

        return returnArr;
    }
}


Array.prototype.contains = function (obj) {
    return this.indexOf(obj) != -1;
};


Array.prototype.copy = function (obj) {
    return this.concat();
};


Array.prototype.insertAt = function (obj, i) {
    this.splice(i, 0, obj);
};


Array.prototype.insertBefore = function (obj, obj2) {
    var i = this.indexOf(obj2);
    if (i == -1)
        this.push(obj);
    else
        this.splice(i, 0, obj);
};


Array.prototype.removeAt = function (i) {
    this.splice(i, 1);
};

Array.prototype.remove = function (obj) {
    var i = this.indexOf(obj);
    if (i != -1) {
        this.splice(i, 1);
    }
};

Array.prototype.removeAll = function (obj) {
    for (var i = 0, length = this.length; i < length; i++) {
        var j = this.indexOf(obj);
        if (j != -1) {
            this.splice(j, 1);
        } else {
            break;
        }
    }
};
