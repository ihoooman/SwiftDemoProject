#
//   generate-icons.sh
//  test
//
//  Created by Hooman Maddah on 7/8/25.
//

#!/usr/bin/env bash
# آدرس پوشه‌ی AppIcon.appiconset در پروژه
ICONSET="Media.xcassets/icon.png.imageset"
# نام فایل مبنا
BASE_ICON="$ICONSET/icon.png"

# اندازه‌های موردنیاز (pt) برای macOS
sizes=(16 32 128 256 512)

for pt in "${sizes[@]}"; do
  # یک‌بار @1x
  sips -Z $pt $BASE_ICON --out "$ICONSET/icon_${pt}x${pt}.png"
  # یک‌بار @2x
  scale2=$((pt * 2))
  sips -Z $scale2 $BASE_ICON --out "$ICONSET/icon_${pt}x${pt}@2x.png"
done

echo "✅ Icons generated in $ICONSET"
