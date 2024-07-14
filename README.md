# dotconfig-ministation
.config folder from my Fedora Workstation penboot installation

## notes

### configuring `biome` for `js/ts/jsx/tsx/json` formatting

first install `biome` locally in your project via

```bash
$ npm i -D @biomejs/biome
```

then create a file called `biome.json` in your project's root folder and use the following config as a base

```json
{
	"$schema": "./node_modules/@biomejs/biome/configuration_schema.json",
	"organizeImports": {
		"enabled": true
	},
	"formatter": {
		"enabled": true,
		"formatWithErrors": true,
		"indentStyle": "tab",
		"indentWidth": 2,
		"lineWidth": 120
	},
	"javascript": {
		"formatter": {
			"quoteStyle": "single",
			"jsxQuoteStyle": "single"
		},
		"globals": [
			"__DEV__"
		]
	},
	"linter": {
		"enabled": true,
		"ignore": [
			"node_modules"
		],
		"rules": {
			"all": true,
			"complexity": {
				"noUselessFragments": "off"
			},
			"style": {
				"useSingleVarDeclarator": "off",
				"noParameterAssign": "off",
				"noNonNullAssertion": "off"
			},
			"suspicious": {
				"noExplicitAny": "off"
			}
		}
	}
}
```
