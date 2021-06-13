module PracticePdf
  class PostPdf < Prawn::Document
    FONT = 'app/assets/fonts/SourceHanSans-Normal.ttc'
    FONT_BOLD = 'app/assets/fonts/SourceHanSans-Bold.ttc'
    FONT_EXTRALIGHT = 'app/assets/fonts/SourceHanSans-ExtraLight.ttc'
    FONT_HEAVY = 'app/assets/fonts/SourceHanSans-Heavy.ttc'
    FONT_LIGHT = 'app/assets/fonts/SourceHanSans-Light.ttc'
    FONT_MEDIUM = 'app/assets/fonts/SourceHanSans-Medium.ttc'
    FONT_NORMAL = 'app/assets/fonts/SourceHanSans-Regular.ttc'


    def initialize(post_pdf)
      super(page_size: 'A4') # 新規PDF作成
      stroke_axis # 座標を表示
 
      @diaries = post_pdf
      
      
      
      font FONT_NORMAL
      
      header
      move_down 50
      contents
    end

    def header
      text '児童状況一覧',size: 50
      move_down 10
      text '　月　日分',size: 30
    end

    def contents
      @diaries.each do |diary|
        child = Child.find_by(id: diary.children_id)
        
        table  [["児童名", "日誌内容"],
        [child.name,
        if diary.living.present?
          "(生活状況)   #{diary.living}"
        elsif diary.health.present?
          "(健康状況)   #{diary.health}"
        elsif diary.visit.present?
          "(面会状況)   #{diary.visit}"
        elsif diary.information.present?
          "(共有事項)   #{diary.information}"
        end]
        ]
      end
    end
  end
end
