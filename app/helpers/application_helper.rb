module ApplicationHelper
    
  def default_meta_tags
    {
      site: '明日につながる指導案',
      title: '指導案ラボ',
      reverse: true,
      charset: 'utf-8',
      description: '指導案データベースサイトです。指導案の閲覧、ダウンロードができます。研究授業に向けて作った指導案を共有して、より良い授業を作りましょう。',
      keywords: '指導案,研究授業',
      canonical: request.original_url,
      separator: '-',
      
    #  icon: [
     #   { href: image_url('#') },
      #  { href: image_url('#'), rel: '#', sizes: '180x180', type: 'image/jpg' },
      #],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        #description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('https://res.cloudinary.com/hkc1jmpeu/image/upload/v1569754088/2afb6497a3b5867f4f02e8459cee7e1f_o1mdfx'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@deen5y',
      }
    }
  end
end
    