#!/usr/bin/env python3
"""Build the letter-size CxPortal module one-pager deck from the HTML starter copy."""

import json
import subprocess
from pathlib import Path

from pptx import Presentation
from pptx.dml.color import RGBColor
from pptx.enum.shapes import MSO_SHAPE
from pptx.enum.text import MSO_ANCHOR, PP_ALIGN
from pptx.oxml.ns import qn
from pptx.util import Emu, Inches, Pt

ROOT = Path(__file__).resolve().parent
HTML = ROOT / "cxportal-module-one-pager.html"
OUT = ROOT / "cxportal-module-one-pager.pptx"

DEEP = "101010"
GALAXY = "97CA6F"
GREEN = "CBEFAE"
INK = "1B350A"
PAPER = "FFFFFF"
WHITE = "FFFFFF"
FONT = "Roboto"


def modules():
    script = r"""
const fs = require('fs');
const html = fs.readFileSync(process.argv[1], 'utf8');
const start = html.indexOf('const MODULES = ') + 'const MODULES = '.length;
const end = html.indexOf('const byId');
let literal = html.slice(start, end).trim().replace(/;$/, '');
const MODULES = eval('(' + literal + ')');
process.stdout.write(JSON.stringify(MODULES));
"""
    raw = subprocess.check_output(["node", "-e", script, str(HTML)])
    return json.loads(raw)


def rgb(value):
    return RGBColor.from_string(value)


def rect(slide, x, y, w, h, fill):
    shape = slide.shapes.add_shape(MSO_SHAPE.RECTANGLE, Inches(x), Inches(y), Inches(w), Inches(h))
    shape.fill.solid()
    shape.fill.fore_color.rgb = rgb(fill)
    shape.line.fill.background()
    shape.shadow.inherit = False
    return shape


def write(shape, text, size, color, bold=False, italic=False, align=PP_ALIGN.LEFT, anchor=MSO_ANCHOR.TOP, spacing=None, line=1.08):
    frame = shape.text_frame
    frame.clear()
    frame.word_wrap = True
    frame.auto_size = None
    frame.margin_left = Emu(0)
    frame.margin_right = Emu(0)
    frame.margin_top = Emu(0)
    frame.margin_bottom = Emu(0)
    frame.paragraphs[0].alignment = align
    try:
        frame._txBody.bodyPr.set("anchor", {MSO_ANCHOR.TOP: "t", MSO_ANCHOR.MIDDLE: "ctr", MSO_ANCHOR.BOTTOM: "b"}[anchor])
    except Exception:
        pass
    paragraph = frame.paragraphs[0]
    paragraph.alignment = align
    paragraph.space_before = Pt(0)
    paragraph.space_after = Pt(0)
    paragraph.line_spacing = line
    run = paragraph.add_run()
    run.text = text
    run.font.name = FONT
    run.font.size = Pt(size)
    run.font.bold = bold
    run.font.italic = italic or ("{{" in text)
    run.font.color.rgb = rgb(color)
    if spacing:
        run._r.get_or_add_rPr().set("spc", str(spacing))
    return shape


def text(slide, x, y, w, h, value, size, color, bold=False, italic=False, align=PP_ALIGN.LEFT, anchor=MSO_ANCHOR.TOP, spacing=None, line=1.08):
    box = slide.shapes.add_textbox(Inches(x), Inches(y), Inches(w), Inches(h))
    box.shadow.inherit = False
    return write(box, value, size, color, bold, italic, align, anchor, spacing, line)


def kicker(slide, x, y, w, label, color=INK):
    text(slide, x, y, w, 0.24, label.upper() + "   →", 9, color, bold=True, spacing=140)


def build(prs, mod):
    slide = prs.slides.add_slide(prs.slide_layouts[6])
    slide._element.find(qn("p:cSld")).set("name", mod["label"])
    fill = slide.background.fill
    fill.solid()
    fill.fore_color.rgb = rgb(PAPER)

    rect(slide, 0, 0, 8.5, 0.72, DEEP)
    rect(slide, 0, 0.72, 8.5, 0.05, GREEN)
    text(slide, 0.40, 0.24, 4.2, 0.32, "CAYLENT", 13, WHITE, bold=True, spacing=760, anchor=MSO_ANCHOR.MIDDLE)
    text(slide, 4.70, 0.14, 3.40, 0.30, "CxPortal", 16, WHITE, bold=True, align=PP_ALIGN.RIGHT, anchor=MSO_ANCHOR.MIDDLE)
    text(slide, 4.70, 0.44, 3.40, 0.20, "AMAZON CONNECT", 9, GREEN, bold=True, align=PP_ALIGN.RIGHT, spacing=120)

    kicker(slide, 0.40, 0.90, 3.4, "CxPortal module")
    chip = rect(slide, 5.85, 0.88, 2.25, 0.30, GREEN)
    write(chip, mod["category"].upper(), 8, INK, bold=True, align=PP_ALIGN.CENTER, anchor=MSO_ANCHOR.MIDDLE, spacing=80)

    text(slide, 0.40, 1.26, 7.70, 0.50, mod["name"], 24, DEEP, bold=True, line=1.0)
    text(slide, 0.40, 1.78, 7.70, 0.62, mod["headline"], 13, INK, bold=True, line=1.12)

    kicker(slide, 0.40, 2.50, 3.6, "The situation")
    kicker(slide, 4.28, 2.50, 3.8, "What changes")
    for index, pain in enumerate(mod["pains"]):
        top = 2.82 + index * 0.64
        rect(slide, 0.40, top + 0.06, 0.09, 0.09, GALAXY)
        text(slide, 0.58, top, 3.48, 0.60, pain, 11, DEEP, line=1.08)
    panel = rect(slide, 4.28, 2.80, 3.82, 1.92, GREEN)
    write(panel, mod["shift"], 12, INK, bold=True, anchor=MSO_ANCHOR.TOP, line=1.08)
    panel.text_frame.margin_left = Inches(0.12)
    panel.text_frame.margin_right = Inches(0.12)
    panel.text_frame.margin_top = Inches(0.10)
    panel.text_frame.margin_bottom = Inches(0.08)

    kicker(slide, 0.40, 4.88, 7.7, "What your team can do")
    for index, (title, body) in enumerate(mod["caps"]):
        col = index % 2
        row = index // 2
        x = 0.40 + col * 3.95
        y = 5.18 + row * 0.88
        text(slide, x, y, 0.36, 0.28, f"{index + 1:02d}", 11, INK, bold=True)
        text(slide, x + 0.36, y, 3.40, 0.28, title, 12, DEEP, bold=True)
        text(slide, x + 0.36, y + 0.28, 3.40, 0.54, body, 11, DEEP, line=1.05)

    kicker(slide, 0.40, 7.02, 7.7, "Who it's for")
    width = 2.46
    for index, (role, body) in enumerate(mod["people"]):
        x = 0.40 + index * (width + 0.16)
        rect(slide, x, 7.32, width, 0.035, GALAXY)
        text(slide, x, 7.42, width, 0.28, role, 12, DEEP, bold=True)
        text(slide, x, 7.70, width, 0.58, body, 11, DEEP, line=1.05)

    rect(slide, 0, 8.48, 8.5, 2.52, DEEP)
    rect(slide, 0, 8.48, 8.5, 0.05, GREEN)
    kicker(slide, 0.40, 8.64, 7.7, "Why it matters", GREEN)
    for index, (label, body) in enumerate(mod["outcomes"]):
        x = 0.40 + index * (width + 0.16)
        text(slide, x, 8.96, width, 0.26, label, 12, GREEN, bold=True)
        text(slide, x, 9.24, width, 0.62, body, 11, WHITE, line=1.05)
    rect(slide, 0.40, 9.92, 7.70, 0.012, "3D5C32")
    text(slide, 0.40, 10.02, 7.70, 0.42, mod["fit"], 10, WHITE, line=1.05)
    text(slide, 0.40, 10.46, 3.3, 0.24, "Prepared for {{Account name}}", 9, WHITE)
    text(slide, 3.70, 10.46, 2.2, 0.24, "{{Your name}}", 9, WHITE, align=PP_ALIGN.CENTER)
    text(slide, 5.90, 10.46, 2.20, 0.24, "{{Date}}", 9, WHITE, align=PP_ALIGN.RIGHT)
    text(slide, 0.40, 10.72, 7.70, 0.22, "AWS PREMIER TIER SERVICES PARTNER   ·   CAYLENT.COM", 8, GREEN, bold=True, spacing=80)

    notes = (
        "Starter copy follows the CxPortal product guides. Edit any line for the account before you send it. "
        "Delete the other slides so the buyer receives this one page. "
        "File, Print: Letter, one slide per page, no extra margins, background graphics on."
        if mod["id"] != "blank"
        else
        "Blank template. Replace every field in double braces. Or duplicate a filled module slide and edit that. "
        "Keep the page to one sheet. Print: Letter, one slide per page, no extra margins, background graphics on. "
        "The coaching on this note does not appear on the page."
    )
    slide.notes_slide.notes_text_frame.text = notes


def main():
    prs = Presentation()
    prs.slide_width = Inches(8.5)
    prs.slide_height = Inches(11)
    prs.core_properties.title = "CxPortal module one-pager"
    prs.core_properties.subject = "Caylent sales template for any CxPortal module"
    prs.core_properties.category = "Sales"
    for mod in modules():
        build(prs, mod)
    prs.save(OUT)
    print(OUT, OUT.stat().st_size)


if __name__ == "__main__":
    main()
