class PostPdfController < ApplicationController
  def home
    @diaries = ChildrenDiary.search(params[:date])
  end
  
  def index
    @diaries = ChildrenDiary.search(params[:search_date])
    @children = Child.all
    respond_to do |format|
      format.pdf do
        post_pdf = PracticePdf::PostPdf.new(@diaries)
        
        send_data post_pdf.render,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end
  
  def contents
  end 
end