#!/usr/bin/env python3
"""
Extract text from PDF files using pdfplumber
"""
import pdfplumber
import sys

def extract_pdf_text(pdf_path):
    """Extract text from PDF file"""
    try:
        with pdfplumber.open(pdf_path) as pdf:
            text = ""
            for page in pdf.pages:
                page_text = page.extract_text()
                if page_text:
                    text += page_text + "\n\n"
            return text
    except Exception as e:
        return f"Error extracting PDF: {str(e)}"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 extract_pdf.py <pdf_file>")
        sys.exit(1)
    
    pdf_file = sys.argv[1]
    extracted_text = extract_pdf_text(pdf_file)
    print(extracted_text)