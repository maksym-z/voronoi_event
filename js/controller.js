var controller = function() {
	this.model = new dataModel(this);
	this.view = new mapView(this);
	this.createSector = function(owner) {
		var freeIndex = this.model.sectors.length;
		this.model.addSector(freeIndex);
		this.view.addPolygon(freeIndex);
		return freeIndex;
	}

	for (var i = 0; i < voronoi_points.length; i++) {
		this.createSector(i);
	};
}
