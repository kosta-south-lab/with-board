package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.MatchAlarm;

public interface MatchAlarmRepository extends JpaRepository<MatchAlarm, Long> {

}
