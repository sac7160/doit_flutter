* dio 패키지 : 파일을 내려받는 데 도움을 주는 패키지
* path_provider : 내부 저장소를 이용하는 패키지
* getApplicationDocumentsDirectory : path_provider 패키지가 제공, 플러터 앱의 내부 디렉터리를 가져오는 역할
* FutureBuilder 위젯 : 아직 데이터가 없지만 앞으로 데이터를 받아서 처리한 후에 만들겠다는 의미
* FutureBuilder는 builder에서 snapshot이라는 변수를 반환
* snapshot : FutureBuilder.future에서 받아온 데이터를 저장한 dynamic 형태의 변수
* evict()함수 : 플러터는 빠른 이미지 처리를 위해 캐시에 같은 이름의 이미지가 있으면 이미지를 변경하지 않고 해당 이미지를 사용함. 이때 이 함수를 호출해 캐시를 비우면 같은 이름이어도 이미지를 갱신함
