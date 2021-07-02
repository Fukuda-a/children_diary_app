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
      super(page_size: 'A4')# 新規PDF作成
      #stroke_axis # 座標を表示
 
      @diaries = post_pdf
      
      
      font FONT_NORMAL
      
      text '社会福祉法人　〇〇施設',size: 20
      header
      contents
      number_pages('<page> / <total>', at: [bounds.right - 50, 0])
    end

    def header
      date = @diaries.first.date
        text "#{date}" ,size: 15
     
      rows = [
        [ '児童名',{ content: '日誌内容', colspan: 2 }]
        ]

        table rows, cell_style: { height: 20, width: 400, padding: 0 } do
        # 文字サイズ
        cells.size = 15
        # 1行目はセンター寄せ
        row(0).align = :center
        # 1行目の背景色
        row(0).background_color = 'c8c9ce'
        # 1列目の横幅
        columns(0).width = 110
        # 行列の最終の文字を小さく
        columns(-1).row(-1).size = 5
        # 行列の枠は四方固める
        columns(-1).row(-1).borders = %i[top bottom left right]
        end   
    end

    def contents
      
      bounding_box([0,715], :width=>510,:height=>650){ 
        @diaries.each do |diary|
        child = Child.find_by(id: diary.children_id)  
        rows = [
          
          [ child.name,{ content: 
                  if diary.living.present?
                    "【生活状況】   #{diary.living}"
                  elsif diary.health.present?
                    "【健康状況】   #{diary.health}"
                  elsif diary.visit.present?
                    "【面会状況】　  #{diary.visit}"
                  elsif diary.information.present?
                    "【共有事項】   #{diary.information}"
                  end,
                  colspan: 2 }]]

        table rows, cell_style: { width: 400, padding: 5 }, header: true do
        # 文字サイズ
        cells.size = 12
        # 1行目はセンター寄せ
        columns(0).align = :center
        # 1列目の横幅を30に
        columns(0).width = 110
        
        
        
        
        end
      end
      }
    end
  end
end

