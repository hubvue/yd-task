"use strict";

System.register([], function (_export, _context) {
  "use strict";

  var Create;

  function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

  function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

  function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

  return {
    setters: [],
    execute: function () {
      Create =
      /*#__PURE__*/
      function () {
        function Create() {
          _classCallCheck(this, Create);

          this.btn = $("#btn");
          this.init();
        }

        _createClass(Create, [{
          key: "init",
          value: function init() {
            this.bindEvent();
          }
        }, {
          key: "bindEvent",
          value: function bindEvent() {
            this.btn.click(util.throttle(this.submit, 1000));
          }
        }, {
          key: "submit",
          value: function submit() {
            var urlSearchParams = new URLSearchParams();
            urlSearchParams.append('isbn', $("#bookIsbn").val());
            urlSearchParams.append('name', $("#bookName").val());
            urlSearchParams.append('author', $("#bookAuthor").val());
            urlSearchParams.append('press', $("#bookPress").val());
            urlSearchParams.append('price', $("#bookPrice").val());
            urlSearchParams.append('time', $("#bookTime").val());
            urlSearchParams.append('image', $("#bookImgUrl").val());
            urlSearchParams.append('introduction', $("[name='book_introduction']").val());
            fetch('/book/create', {
              method: "POST",
              body: urlSearchParams
            }).then(function (res) {
              return res.json();
            }).then(function (json) {
              if (json.code == 1 && json.message == 'ok') {
                location.href = '/book';
              } else {
                alert('新增图书失败!');
              }
            }).catch(function (err) {
              alert("新增图书失败！");
            });
          }
        }]);

        return Create;
      }();

      _export("default", Create);
    }
  };
});
