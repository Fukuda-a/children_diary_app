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
    first = @diaries.first.date
      text '児童状況一覧',size: 50
      text "#{first}" ,size: 30
      move_down 10
    end

    def contents
      
      rows = [
        [ '児童名',{ content: '日誌内容', colspan: 2 }]
        ]

        table rows, cell_style: { height: 20, width: 400, padding: 0 } do
        # 文字サイズ
        cells.size = 15
        # 1行目はセンター寄せ
        row(0).align = :center
        # 1行目の背景色をff7500に
        row(0).background_color = 'f5f5f5'
        # 1列目の横幅を30に
        columns(0).width = 100
        # 行列の最終の文字を小さく
        columns(-1).row(-1).size = 5
        # 行列の枠は四方固める
        columns(-1).row(-1).borders = %i[top bottom left right]
        end
        
        
        @diaries.each do |diary|
        child = Child.find_by(id: diary.children_id)  
        rows = [
          [ child.name,{ content: 
                  if diary.living.present?
                    "(生活状況)   #{diary.living}"
                  elsif diary.health.present?
                    "(健康状況)   #{diary.health}"
                  elsif diary.visit.present?
                    "(面会状況)   #{diary.visit}"
                  elsif diary.information.present?
                    "(共有事項)   #{diary.information}"
                  end,
                  colspan: 2 }]]

        table rows, cell_style: { height: 20, width: 400, padding: 0 } do
        # 文字サイズ
        cells.size = 15
        # 1行目はセンター寄せ
        row(0).align = :center
        # 1列目の横幅を30に
        columns(0).width = 100
        end
      end
    end
  end
end

