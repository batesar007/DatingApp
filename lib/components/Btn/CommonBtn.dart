import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:flutter/material.dart';

class CommonBtn extends StatelessWidget {
  final String btn_name;
  final Color? txtclr;
  final Color? bgclr;
  final bool isexpanded;
  final TextStyle? txtstyle;
  final Function onPressed;
  CommonBtn(
      {super.key,
      required this.btn_name,    
      this.txtclr,
      this.bgclr,
      this.isexpanded = false,
      this.txtstyle,
      required this.onPressed});
  final appclr = Appcolor();
  final txttheme = AppTextTheme();

  @override
  Widget build(BuildContext context) {
    final btn = TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgclr == null ? appclr.Premiery : bgclr),
        onPressed: () {
          onPressed();
        },
        child: Text(
          btn_name,
          style: txtstyle == null
              ? txttheme
                  .fs16Medium()
                  .copyWith(color: txtclr == null ? appclr.White : txtclr)
              : txtstyle,
        ));
    return isexpanded ? Expanded(child: btn) : btn;
  }
}

// class CustomWavePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     for (double i = 0; i <= size.width; i++) {
//       path.lineTo(
//           i,
//           math.sin(i * math.pi / 180) * 20 +
//               size.height / 2); // Adjust the amplitude and frequency here
//     }
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);
//   }
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
// class CustomWavePainterExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Wave Painter Example'),
//       ),
//       body: Center(
//         child: CustomPaint(
//           size:
//               Size(300, 200), // You can set the size of the CustomPaint widget
//           painter: CustomWavePainter(),
//         ),
//       ),
//     );
//   }
// }
