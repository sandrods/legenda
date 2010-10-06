require 'open-uri'
  
class Legendas

  def self.destaques

    ret =  extract("http://www.legendas.tv/destaques.php")
    ret << extract("http://www.legendas.tv/destaques.php?start=24")
    ret.flatten

  end

  private
  
  def self.extract(url)
    doc = Hpricot(open(url))
    leg = []
    (doc/"div.Ldestaque").each do |d|
      nome = $1 if d.attributes['onmouseover']=~/gpop\('(?:.*','){2}(.*)','(.*','){5}/
      id = $1 if d.attributes['onclick']=~/javascript:abredown\('(.*)'\);/
      img = (d/"img")[0].attributes['src']
      leg << { :nome => nome[0..35], :id => id, :image => img }
    end
    leg
  end

end