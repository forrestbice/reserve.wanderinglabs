class AvailabilityImportSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :date_start, :date_end, :history_open_count, :history_filled_count,
             :history_open, :history_filled

  belongs_to :facility

  def attributes(*args)
    if @instance_options[:expanded].present?
      super
    else
      super.except(:history_open, :history_filled)
    end
  end

  def history_open
    return nil unless object.history_open
    object.history_open.map do |h|
      {
        site_id: Site.find(h['site_id']).site_num,
        avail_date: h['avail_date'],
      }
    end
  end

  def history_filled
    return nil unless object.history_filled
    object.history_filled.map do |h|
      {
        site_id: Site.find(h['site_id']).site_num,
        avail_date: h['avail_date'],
      }
    end
  end

  def history_open_count
    object.history_open&.size || 0
  end

  def history_filled_count
    object.history_filled&.size || 0
  end
end
