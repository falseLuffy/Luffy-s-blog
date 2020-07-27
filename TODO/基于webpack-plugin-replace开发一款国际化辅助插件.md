```
const motherLanguage = {}

module.exports = {
  // ...
  plugins: [
    new ReplacePlugin({
      exclude: [
        'foo.js',
        /node_modules/,
        filepath => filepath.includes('ignore')
      ],
      patterns: [{
        regex: /$t\([\'\"](.*?)[\'\"]\)/g,
        value: function(value, match){
            return motherLanguage[value]
        }
      }],
      values: {
        'process.env.NODE_ENV': JSON.stringify('production'),
        'FOO_BAR': '"hello world"',
        'DEV_MODE': false,
      }
    })
  ]
};
```