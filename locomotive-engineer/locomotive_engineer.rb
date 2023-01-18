class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon)
    [*wagon]
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    locomotive_id = each_wagons_id[0..1]
    [each_wagons_id[2], *missing_wagons, *each_wagons_id[3..], *locomotive_id]
  end

  # 任意のキーワードを引数に取る **
  def self.add_missing_stops(routing_hash, **stops)
    {**routing_hash, stops: [*stops.values]}
  end

  def self.extend_route_information(route, more_route_information)
    # 二つの引数をmergeする
    { **route, **more_route_information}
  end
end
