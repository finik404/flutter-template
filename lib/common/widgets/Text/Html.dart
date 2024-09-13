import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as html_dom;

class UIHtml extends StatelessWidget {
  const UIHtml(
    this.text, {
    super.key,
    this.size,
    this.color,
    this.weight,
    this.lineHeight,
    this.linkColor,
  });

  final String text;
  final double? size, lineHeight;
  final Color? color, linkColor;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    final textSpans = _parseHtmlToTextSpans(text, context);
    print('textSpans ${textSpans}');

    return RichText(
      text: TextSpan(
        children: textSpans,
        style: TextStyle(
          fontSize: size ?? 16,
          fontWeight: weight ?? FontWeight.normal,
          height: lineHeight,
          color: color ?? Colors.black,
        ),
      ),
      maxLines: 8,
      overflow: TextOverflow.ellipsis,
    );
  }
}

List<TextSpan> _parseHtmlToTextSpans(String html, BuildContext context) {
  final document = html_parser.parse(html);
  final List<TextSpan> spans = [];

  document.body?.nodes.forEach((node) {
    if (node.nodeType == html_dom.Node.TEXT_NODE) {
      // Обычный текст
      spans.add(TextSpan(text: node.text));
    } else if (node is html_dom.Element) {
      if (node.localName == 'a') {
        // Ссылка
        final url = node.attributes['href'] ?? '';
        final linkText = node.text;

        spans.add(
          TextSpan(
            text: linkText,
            style: TextStyle(color: Colors.blue),
            // recognizer: TapGestureRecognizer()..onTap = () => _launchUrl(url),
          ),
        );
      } else if (node.localName == 'p') {
        // Параграф
        node.nodes.forEach((childNode) {
          if (childNode.nodeType == html_dom.Node.TEXT_NODE) {
            spans.add(TextSpan(text: childNode.text));
          } else if (childNode is html_dom.Element && childNode.localName == 'a') {
            final url = childNode.attributes['href'] ?? '';
            final linkText = childNode.text;

            spans.add(
              TextSpan(
                text: linkText,
                style: TextStyle(color: Colors.blue),
                // recognizer: TapGestureRecognizer()..onTap = () => launchUrl(url),
              ),
            );
          }
        });
        // Добавляем перенос строки после каждого параграфа
        spans.add(TextSpan(text: '\n\n'));
      }
    }
  });

  return spans;
}

