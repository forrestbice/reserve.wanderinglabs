class Facility::ReserveCalifornia < Facility
  def place_id
    details['place_id']
  end

  def rc_facility_id
    details['facility_id']
  end

  def sub_name
    'California State Parks'
  end

  def sns_scraper
    ENV['AWS_SNS_SCRAPER_RC']
  end

  def scraper_details
    {
      facilityId: id,
      rcFacilityId: rc_facility_id,
      rcPlaceId: place_id,
      hash: last_import_hash,
    }
  end
end
