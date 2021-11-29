package withboard.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import withboard.mvc.repository.AuthoritiesRepository;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService {

	@Autowired
	private AuthoritiesRepository authoritiesRepository;
	
	
}
