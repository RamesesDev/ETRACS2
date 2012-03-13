function ProgramCourse() {

	var svc = ProxyService.lookup( "ProgramAdminService" );

	this.programName;
	this.selectedProgram;
	this.courseName;
	this.selectedCourse;
	this.programid;
	this.yearLevels = [];
	
	var self = this;
	
	this.programLookup = function(txt) {
		if(!txt) return null;
		return svc.findPrograms( {code : '%'+txt+'%' });
	}

	this.courseLookup = function(txt) {
		if(!txt) return null;
		return svc.findCourses( {code : '%'+txt+'%', programid:self.programid });
	}

	this.buildYearLevels = function(yrs) {
		this.yearLevels = []
		for( var i=0; i < yrs; i++) {
			this.yearLevels[i] = i+1;
		}		
	}	
}

