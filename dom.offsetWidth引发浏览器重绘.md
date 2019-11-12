dom.offseWidth 方法获取元素尺寸时会引发浏览器的重绘，因此除非在连续变化css样式时使transition触发上使用外，其他场景尽量避免使用，可以用 dom.getBoundingClientRect获取元素尺寸。

虽然这么说，但是在一般场景下，dom.offsetWidth方法引起的额外开销并不明显，除非有上万的dom的场景。

据说有个项目使用offsetWidth方法后页面加载时间是20-30s ，使用getBoundingClientRect方法后页面的加载时间是20-30ms,就是有这么大的差距。。。

ps 这是大佬张鑫旭发现的，此处只作为笔记记录。