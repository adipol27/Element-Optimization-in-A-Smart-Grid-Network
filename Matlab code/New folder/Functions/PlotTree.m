function [] = PlotTree(verticies)
    i = 1;
    for vertex = [verticies.bus_number]
        bus(i).bus_number = vertex;
        if isfield(verticies(vertex), 'original_vertex')
            bus(i).origin = verticies(vertex).original_vertex;
        else
            bus(i).origin = '';
        end
        reverse(vertex) = i;
        i = i + 1;
    end
    for i = 1 : length(bus)
        old_perent = verticies(bus(i).bus_number).Perent;
        if old_perent > 0
             bus(i).Perent = reverse(old_perent);
        else
            bus(i).Perent = 0;
        end
    end
    treeplot([bus.Perent])
    [x,y] = treelayout([bus.Perent]);
    for i = 1 : length(bus)
        if bus(i).origin 
            str = [num2str(bus(i).bus_number) , ' (' , num2str(bus(i).origin) , ')'];
        else
            str = num2str(bus(i).bus_number);
        end
        text(x(i)+0.01,y(i),str)
    end
end