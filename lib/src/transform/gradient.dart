import 'dart:typed_data';

import '../image.dart';
import '../color.dart';
import '../filter/gaussian_blur.dart';
import 'copy_resize.dart';

List<int> _get_histogram(Image image, int Function(int) fn) {
  Uint8List bytes = image.getBytes();
  List<int> hist = List.filled(256, 0);
  for (int byte in bytes) {
    hist[fn(byte)]++;
  }
  return hist;
}

void _get_colors(Image image) {
  Image resized = copyResize(image, 55, 55);
  Image h = gaussianBlur(resized, 2);

  List<int> r = _get_histogram(image, getRed);
  List<int> g = _get_histogram(image, getGreen);
  List<int> b = _get_histogram(image, getBlue);
}

//
//  image = image.resize((55, 55), Image.ANTIALIAS)
//
//h = image.filter(ImageFilter.BLUR)

//h = h.histogram()
//colors = []
//# split into red, green, blue
//r = h[0:256]
//g = h[256:256 * 2]
//b = h[256 * 2: 256 * 3]

//# Rank the histogram in order of appearance
//ranked_colors = sorted(image.getcolors(image.size[0] * image.size[1]), key=itemgetter(0))
//for i in range(len(ranked_colors)):
//colors.append(ranked_colors[len(ranked_colors) - 1 - i])
//if self.MAX_COLORS is 1:
//return colors[0]
//else:
//return self.find_best_colors(colors)
//
//_get_directions():
//  col = self.get_colors()
//
//  if self.single_color:
//  return col
//
//  quad_cols = [0] * 4
//  taken = [0] * 4
//  cols_quads = [0] * 4
//
//  for i in range(len(col)):
//  count = 0
//  # 0 - left, 1 - bottom, 2 - right, 3 - top
//  a = [0] * 4
//  for pix in self.image.getdata():
//  if self.get_rgb_diff(pix, col[i]) < 4.2:
//  if int((count % 100) / 50) == 1:
//  a[2] += 1
//  else:
//  a[0] += 1
//  if int((count / 100.0) / 50) == 0:
//  a[3] += 1
//  else:
//  a[1] += 1
//  count += 1
//  cols_quads[i] = a
//  while 0 in taken and not self.use_color_spread:
//  best_quad = a.index(max(a))
//  if max(a) == 0:
//  best_quad = taken.index(0)
//  if taken[best_quad] == 0:
//  taken[best_quad] = 1
//  col[i] = list(col[i])
//  col[i].append(best_quad * 90)
//  quad_cols[i] = col[i]
//  break
//  else:
//  a[best_quad] = 0
//
//  if self.use_color_spread:
//  quad_cols = self.calculate_spread(cols_quads, col)
//
//  return quad_cols
//
//
//
//String gradient(Image src) {
//  c = self.get_directions()
//  if self.single_color:
//  return "background-color: rgb(%d,%d,%d);" % (c[0], c[1], c[2])
//  else:
//  s = "background-color: rgb(%d,%d,%d);" % (c[0][0], c[0][1], c[0][2])
//  for prefix in self.BROWSER_PREFIXES:
//  s += "background-image:"
//  i = 0
//  for color in c:
//  s += prefix + 'linear-gradient({}deg, rgba({},{},{},1) 0%, rgba({},{},{},0) 100%)'.format(
//  color[3],
//  color[0], color[1], color[2],
//  color[0], color[1], color[2],
//  )
//  i += 1
//  if i == self.MAX_COLORS:
//  s += ";"
//  break
//  s += ","
//  return s
//
//
//
//}
