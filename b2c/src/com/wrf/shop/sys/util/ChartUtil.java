package com.wrf.shop.sys.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import com.wrf.shop.sys.model.BarChart;
import com.wrf.shop.sys.model.PieChart;
import com.wrf.shop.sys.services.ChartServices;

/**
 @ClassName ChartUtil
 * @Description 
 * @Author invincible
 * @Date 2018年4月3日 上午9:24:53
 */
public class ChartUtil {
	/**
	 * @Title: getBarChart   
	 * @Description: TODO(生成3D柱形图方法)   
	 * @param: @throws IOException      
	 * @return: void      
	 * @throws
	 */
	public static void getBarChart(HttpServletRequest request ,String path) throws IOException{
		CategoryDataset ds = getDataSet();  
        JFreeChart chart = ChartFactory.createBarChart3D(  
                "产品销量图", //图表标题  
                "产品名称", //目录轴的显示标签  
                "销售额", //数值轴的显示标签  
                ds, //数据集  
                PlotOrientation.HORIZONTAL, //图表方向  
                true, //是否显示图例，对于简单的柱状图必须为false  
                false, //是否生成提示工具  
                false);         //是否生成url链接  
  
        CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();  
  
        NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();  
  
        CategoryAxis domainAxis = categoryplot.getDomainAxis();  
  
        /*------设置X轴坐标上的文字-----------*/  
        domainAxis.setTickLabelFont(new Font("sans-serif", Font.BOLD, 11));  
  
        /*------设置X轴的标题文字------------*/  
        domainAxis.setLabelFont(new Font("宋体", Font.BOLD, 12));  
  
        /*------设置Y轴坐标上的文字-----------*/  
        numberaxis.setTickLabelFont(new Font("sans-serif", Font.BOLD, 12));  
  
        /*------设置Y轴的标题文字------------*/  
        numberaxis.setLabelFont(new Font("黑体", Font.PLAIN, 12));  
  
        /*------这句代码解决了底部汉字乱码的问题-----------*/  
        chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));  
  
        /*******这句代码解决了标题汉字乱码的问题********/  
        chart.getTitle().setFont(new Font("宋体", Font.PLAIN, 12));  
        //图片生成路径
         String realPath = request.getServletContext().getRealPath("")+path;	
        FileOutputStream out = null;  
        try {  
        	File file=new File(realPath);
        	if(!file.isDirectory()){
        		file.mkdirs();
        	}
        	file=new File(realPath+"/chart.jpg");
            out = new FileOutputStream(file);  
            ChartUtilities.writeChartAsJPEG(out,  chart, 600, 400, null); 
            System.out.println("柱形图表已经生成!路径:"+path+"/chart.jpg"+"快去看看吧!");
        } finally {  
            try {  
                out.close();  
            } catch (Exception ex) {  
                ex.printStackTrace();  
            }  
        }  
	}
	
	
	//获取数据源方法
	  private static CategoryDataset getDataSet() {  
	        DefaultCategoryDataset ds = new DefaultCategoryDataset();  
	        List<BarChart> barChartList = ChartServices.getBarChart();
	        for(BarChart bar:barChartList){
	        	ds.addValue(bar.getSale(),  bar.getGt_name(),bar.getG_name());  
	        }
	        
	        return ds;  
	    }  
	  
	  
	  
	  /**
	   * 
	   * @Title: PieChart   
	   * @Description: TODO(生成3D饼图)   
	   * @param: @param path      
	   * @return: void      
	   * @throws
	   */
	  public static void PieChart(HttpServletRequest request,String path) {
	        PieDataset dataset =  getDataSet2();

	        JFreeChart chart = ChartFactory.createPieChart3D("产品评论量分布图", dataset, true, true, false);
	        chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));// 设置图例字体样式
	        chart.getTitle().setFont(new Font("黑体", Font.CENTER_BASELINE, 20));// 设置标题字体样式
	        chart.setBackgroundPaint(Color.white);// 设置背景色为白色

	        PiePlot3D plot = (PiePlot3D) chart.getPlot();// 图样式(饼状图)
	        plot.setLabelFont(new Font("宋体", Font.PLAIN, 14));// 图中标签字体样式

	        // 图片中显示百分比:默认方式
	        // plot.setLabelGenerator(new
	        // StandardPieSectionLabelGenerator(StandardPieToolTipGenerator.DEFAULT_TOOLTIP_FORMAT));
	        // 自定义图片中显示百分比:自定义方式，{0} 表示选项， {1} 表示数值， {2} 表示所占比例 ,小数点后两位
	        plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}:{1}({2})", NumberFormat.getNumberInstance(), new DecimalFormat("0.000%")));

	        // 自定义图例中显示百分比:自定义方式， {0} 表示选项， {1} 表示数值， {2} 表示所占比例
	        plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator("{0}:{1}({2})"));

	        // 指定图片的透明度(0.0-1.0)
	        plot.setForegroundAlpha(1.0f);
	        // 指定显示的饼图上圆形(false)还椭圆形(true)
	        plot.setCircular(true);
	        plot.setBackgroundAlpha(0.5f);// 背景色 透明度
	        plot.setBackgroundPaint(new Color(255, 255, 204));// 设置柱图背景色（注意，系统取色的时候要使用16位的模式来查看颜色编码，这样比较准确）

	        FileOutputStream out = null;  
	        try {
	        	//图片生成路径
	            String realPath = request.getServletContext().getRealPath("")+path;	
	           	File file=new File(realPath);
	           	if(!file.isDirectory()){
	           		file.mkdirs();
	           	}
	           	file=new File(realPath+"/pie.jpg");
	               out = new FileOutputStream(file); 
	               
	            ChartUtilities.saveChartAsPNG(file, chart, 640, 480);// 把生成的图保存到文件中
	            System.out.println("饼形图表已经生成!路径:"+path+"/pie.jpg"+"快去看看吧!");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	if(out!=null){
	        		try {
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
	        	}
	        }
	       // ChartPreview(chart);// 显示生成的图
	    }

	    /**
	     * 
	     * @Title getDataSet
	     * @Description 获取饼图数据
	     *
	     */
	    private static  PieDataset getDataSet2() {
	        DefaultPieDataset dataset = new DefaultPieDataset();
	        List<PieChart> pieChatList = ChartServices.getPieChart();
	        for(PieChart pieChart:pieChatList){
	        	dataset.setValue(pieChart.getG_name(), new Double(pieChart.getTotal()));
	        }
	        
	        return dataset;
	    }

	    /**
	     * @Title ChartPreview
	     * @Description 预览图片
	     *
	     */
	    private void ChartPreview(JFreeChart chart) {
	        // ******************************//
	        // * 将生成的报表放到预览窗口中
	        // ******************************//
	        final ChartFrame preview = new ChartFrame("评论统计信息", chart);
	        preview.addWindowListener(new WindowAdapter() {
	            public void windowClosing(final WindowEvent event) {
	                preview.dispose();
	            }
	        });
	        preview.pack();

	        // 调整预览窗口的大小和位置,适合屏幕，并且居中
	        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	        preview.setSize(screenSize.width, screenSize.height - 50);// 适合屏幕，50表示把工具栏要考虑在内
	        Dimension frameSize = preview.getSize();
	        if (frameSize.height > screenSize.height) {
	            frameSize.height = screenSize.height;
	        }
	        if (frameSize.width > screenSize.width) {
	            frameSize.width = screenSize.width;
	        }
	        preview.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height - 50) / 2);
	        preview.setVisible(true);// 显示报表预览窗口
	    }
	  
	  
	  
	  
	  
}
