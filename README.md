# lat-long-launcher
A ruby script to open a map based on any latitude-longitude you copy-paste brutally.

:warning: This is currently a work in progress, the script does not recognize many patterns yet and is not guaranteed to work in all cases.

## How to use it

You'll need ruby and bundler installed on your system.

```bash
git clone https://github.com/inouire/lat-long-launcher.git
cd lat-long-launcher
bundle install
ruby display_on_map.rb your raw string
```

Be careful to adjust the `LAT_RANGE` and `LONG_RANGE` to the zone you're working on. Default ranges target the Europe, centered on France.

## Some examples of what the script is able to recognize

- `Lat: 50,83653 Long: 4,33904`
- `foo 50.83/4,33904 bar`
- `4.33904  -- 50.83 `
