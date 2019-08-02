overflow:hidden与margin:0 auto 当处在同一个div或overflow处于margin: 0 auto的父元素上时，存在冲突，元素无法居中，具体原因不明

解决方法:
  可以用一个子元素包裹，子元素的宽和高保持和父元素相同，子元素设置为overflow: hidden;