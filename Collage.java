import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author Christoph Jansen
 */

public class Collage {

    static String imagesPath = "";
        
    static int bgAlpha = 0;
    static int bgRed = 255;
    static int bgGreen = 255;
    static int bgBlue = 255;

    static int patchWidth = 32;
    static int patchHeight = 32;

    static int rows = 7;
    static int cols = 14;

    static int rowSpacing = 4;
    static int colSpacing = 4;
    
    public static void main(String[] args) throws IOException {
             
        File path = new File(imagesPath);
        File[] images = path.listFiles((dir, name) -> (name.endsWith("jpg") || name.endsWith("png") || name.endsWith("gif")));
        
        int collageWidth = patchWidth * cols + colSpacing * (cols - 1);
        int collageHeight = patchHeight * rows + rowSpacing * (rows - 1);
        
        BufferedImage image = new BufferedImage(collageWidth, collageHeight, BufferedImage.TYPE_INT_ARGB);
        
        Graphics g = image.getGraphics();
        
        g.setColor(new Color(bgRed, bgGreen, bgBlue, bgAlpha));
        g.fillRect(0, 0, collageWidth, collageHeight);
        
        for(int row = 0; row < rows; ++row){
            for(int col = 0; col < cols; ++col){    
                
                Image patch = ImageIO.read(images[(row * cols + col) % images.length]);
                Image scaled = patch.getScaledInstance(patchWidth, patchHeight, Image.SCALE_SMOOTH);
                
                int xPos = col * patchWidth + col * colSpacing;
                int yPos = row * patchHeight + row * rowSpacing;
                
                g.drawImage(scaled, xPos, yPos, null);
            }
        }
        
        File file = new File("collage.png");
        ImageIO.write(image, "png", file);       
    }    
}
