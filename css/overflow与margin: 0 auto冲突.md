overflow:hidden与margin:0 auto 当处在同一个div或overflow处于margin: 0 auto的父元素上时，存在冲突，元素无法居中，具体原因不明

解决方法是将overflow放在目标元素的父元素上。