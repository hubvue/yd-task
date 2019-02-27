"use strict";

System.register([], function (_export, _context) {
  "use strict";

  var Index;

  function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

  function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

  function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

  return {
    setters: [],
    execute: function () {
      Index =
      /*#__PURE__*/
      function () {
        function Index() {
          _classCallCheck(this, Index);

          this.table = $(".table");
          this.init();
        }

        _createClass(Index, [{
          key: "init",
          value: function init() {
            this.bindEvent();
          }
        }, {
          key: "bindEvent",
          value: function bindEvent() {
            this.table.click(function (e) {
              if ($(e.target).attr('title') == 'delete') {
                fetch('/book/delete', {
                  method: 'POST',
                  body: new URLSearchParams([['id', $(e.target).attr('data-id')]])
                }).then(function (res) {
                  return res.json();
                }).then(function (json) {
                  if (json.code == 1 && json.message == 'ok') {
                    alert('删除成功！');
                    location.href = '/book';
                  } else {
                    alert('删除失败！');
                  }
                }).catch(function (err) {
                  alert("删除失败！");
                });
              }
            });
          }
        }]);

        return Index;
      }(); // new Index();


      _export("default", Index);
    }
  };
});
