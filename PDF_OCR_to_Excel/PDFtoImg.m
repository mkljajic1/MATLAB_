function images = PDFtoImg(pdfFile)
import org.apache.pdfbox.*
import java.io.*
filename = fullfile(pwd,pdfFile);
jFile = File(filename);
document = pdmodel.PDDocument.load(jFile);
pdfRenderer = rendering.PDFRenderer(document);
count = document.getNumberOfPages();
images = [];
for ii = 1:count
    bim = pdfRenderer.renderImageWithDPI(ii-1, 300, rendering.ImageType.RGB);
    images = [images (filename + "-" +"Page" + ii + ".png")];
    tools.imageio.ImageIOUtil.writeImage(bim, filename + "-" +"Page" + ii + ".png", 300);
end
document.close()