class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon)
    [*wagon]
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, third, *rest = each_wagons_id
    [third, *missing_wagons, *rest, first, second]
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
