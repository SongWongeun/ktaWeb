/**
 * Ajax Tree Gird Plugin
 *
 * @author 박대영
 */
webponent.grid.AjaxTree = (function () {

    var self = {};
    var indenter = null;
    var expander = null;
    var expanderedTR = null;

    self.init = function (grid, option) {


        indenter = $('<span class="CI-GRID-TREE-INDENTER"></span>');
        expander = $('<a href="#" class="CI-GRID-TREE-EXPANDER">&nbsp;</a>');

        addEventListener(grid, option['generatorParam'], option['ajaxUrl']);

    };

    function addEventListener(_grid, generatorParam, ajaxURL) {
        $(_grid.markup.area).on('click', 'a.CI-GRID-TREE-EXPANDER', function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            var $this = $(this), $tr = $this.closest('TR'), index = $tr[0].index;

            if ($tr.hasClass('CI-GRID-TREE-COLLAPSED')) {
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: ajaxURL,
                    data: $.param($tr.data()),
                    success: function (resp) {
                        expanderedTR = $tr;
                        _grid.appendRow(resp, index);
                        $tr.removeClass('CI-GRID-TREE-COLLAPSED').addClass('CI-GRID-TREE-EXPANDED');
                        expanderedTR = null;
                    }
                });

            } else if ($tr.hasClass('CI-GRID-TREE-EXPANDED')) {
                _grid.removeRow(index + 1, index + getChildCount($tr, $tr.data('__DEPTH__'), _grid) + 1);
                $tr.removeClass('CI-GRID-TREE-EXPANDED').addClass('CI-GRID-TREE-COLLAPSED');
            }

            return false;

        });

        _grid.on('rowRendered', function (e, row, data, index) {
            appendIndenter($(row), data, generatorParam);
        });

    }

    function appendIndenter($row, data, generatorParam) {

        var hasChild = data['__HAS_CHILD__'] === "true", depth = expanderedTR == null ? 0 : expanderedTR.data('__DEPTH__') + 1;
        var _indenter = indenter.clone().css('padding-left', (depth * 15) + 'px'), _expander = expander.clone();

        if (hasChild) {
            $row.addClass('CI-GRID-TREE-COLLAPSED');
        } else {
            _expander.removeAttr('href');
        }

        _indenter.append(_expander);

        $row.data('__DEPTH__', depth);
        if (typeof generatorParam === 'function') {
            var paramObj = generatorParam(data);
            for (var key in paramObj) {
                $row.data(key, paramObj[key]);
            }
        }

        $row.find('TD:not([name=CI_GRID_CHECKBOX_CONTAINER]):eq(0)').prepend(_indenter);
    }

    function getChildCount($tr, depth, _grid) {

        if ($tr[0].index == (_grid.rows.length - 1)) {
            return 0;
        }

        var cnt = 0, $tr = $(_grid.rows[$tr[0].index + 1]);// $tr.next('TR');
        while ($tr.data('__DEPTH__') != undefined && depth != undefined && $tr.data('__DEPTH__') > depth) {
            cnt++;
            if ($tr[0].index == _grid.rows.length - 1) {
                break;
            }

            $tr = $(_grid.rows[$tr[0].index + 1]);
        }

        return cnt;
    }

    return self;
})();