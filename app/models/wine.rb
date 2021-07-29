class Wine < ApplicationRecord
    has_many :assemblies
    has_many :strains, through: :assemblies, dependent: :destroy
    accepts_nested_attributes_for :assemblies, reject_if: :all_blank, allow_destroy: true



    def strain_and_percent
        name_percent = []
        assemblies.map do |ws|
            name_percent.push [ws.strain.name, ws.percent] 
        end
        name_percent.sort_by{ |strain| strain[0] }.map do |cepa|
            "#{cepa[0]} (#{cepa[1]})%"
        end.join(', ')
    end
end
