package test;

import java.io.File;
import java.io.IOException;

import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class writeExcel {
    public static void main(String[] args) throws BiffException, IOException, RowsExceededException, WriteException {
        WritableWorkbook workbook = Workbook.createWorkbook(new File("src/test/resources/write.xls"));
        WritableSheet sheet = workbook.createSheet("First Sheet", 0);
        Label label = new Label(0, 2, "A label record");
        sheet.addCell(label);

        jxl.write.Number number = new jxl.write.Number(3, 4, 3.1459);
        sheet.addCell(number);

        workbook.write();
        workbook.close();
    }
}
