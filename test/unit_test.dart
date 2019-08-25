import 'package:flutter_test/flutter_test.dart';
import 'package:tfl_api_client/tfl_api_client.dart';
import 'package:tfl_api_explorer/specifications/line_mode_name_specification.dart';
import 'package:tfl_api_explorer/specifications/line_route_service_type_specification.dart';
import 'package:tfl_api_explorer/specifications/prediction_destination_name_specification.dart';
import 'package:tfl_api_explorer/specifications/prediction_station_name_specification.dart';
import 'package:tfl_api_explorer/specifications/specification.dart';

void main() {
  final _lineRoutes = <LineRoute>[
    LineRoute(
      serviceType: 'Night',
    ),
    LineRoute(
      serviceType: 'Regular',
    ),
  ];

  final _lines = <Line>[
    Line(
      id: '1',
      name: '1',
      modeName: 'bus',
    ),
    Line(
      id: 'bakerloo',
      name: 'Bakerloo',
      modeName: 'tube',
    ),
  ];

  final _predictions = <Prediction>[
    Prediction(
      stationName: 'Elephant & Castle',
      destinationName: 'Canada Water',
    ),
    Prediction(
      stationName: 'Elephant & Castle',
      destinationName: 'Tottenham Court Road',
    ),
    Prediction(
      stationName: 'Holborn',
      destinationName: 'Canada Water',
    ),
    Prediction(
      stationName: 'Holborn',
      destinationName: 'Tottenham Court Road',
    ),
  ];

  group('specifications', () {
    group('LineModeNameSpecification', () {
      test('isSatisfiedBy', () {
        Specification<Line> specification;

        specification = LineModeNameSpecification('bus');
        expect(
          specification.isSatisfiedBy(_lines[0]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_lines[1]),
          isFalse,
        );
        expect(
          _lines.where(specification.isSatisfiedBy).toList(),
          hasLength(1),
        );

        specification = LineModeNameSpecification('overground');
        expect(
          specification.isSatisfiedBy(_lines[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_lines[1]),
          isFalse,
        );
        expect(
          _lines.where(specification.isSatisfiedBy).toList(),
          isEmpty,
        );

        specification = LineModeNameSpecification('tube');
        expect(
          specification.isSatisfiedBy(_lines[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_lines[1]),
          isTrue,
        );
        expect(
          _lines.where(specification.isSatisfiedBy).toList(),
          hasLength(1),
        );
      });
    });

    group('LineRouteServiceTypeSpecification', () {
      test('isSatisfiedBy', () {
        Specification<LineRoute> specification;

        specification = LineRouteServiceTypeSpecification('Day');
        expect(
          specification.isSatisfiedBy(_lineRoutes[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_lineRoutes[1]),
          isFalse,
        );
        expect(
          _lineRoutes.where(specification.isSatisfiedBy).toList(),
          isEmpty,
        );

        specification = LineRouteServiceTypeSpecification('Night');
        expect(
          specification.isSatisfiedBy(_lineRoutes[0]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_lineRoutes[1]),
          isFalse,
        );
        expect(
          _lineRoutes.where(specification.isSatisfiedBy).toList(),
          hasLength(1),
        );

        specification = LineRouteServiceTypeSpecification('Regular');
        expect(
          specification.isSatisfiedBy(_lineRoutes[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_lineRoutes[1]),
          isTrue,
        );
        expect(
          _lineRoutes.where(specification.isSatisfiedBy).toList(),
          hasLength(1),
        );
      });
    });

    group('PredictionDestinationNameSpecification', () {
      test('isSatisfiedBy', () {
        Specification<Prediction> specification;

        specification = PredictionDestinationNameSpecification(
          'Canada Water',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isFalse,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          hasLength(2),
        );

        specification = PredictionDestinationNameSpecification(
          'Surrey Quays',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isFalse,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          isEmpty,
        );

        specification = PredictionDestinationNameSpecification(
          'Tottenham Court Road',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isTrue,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          hasLength(2),
        );
      });
    });

    group('PredictionStationNameSpecification', () {
      test('isSatisfiedBy', () {
        Specification<Prediction> specification;

        specification = PredictionStationNameSpecification(
          'Elephant & Castle',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isFalse,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          hasLength(2),
        );

        specification = PredictionStationNameSpecification(
          'Holborn',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isTrue,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isTrue,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          hasLength(2),
        );

        specification = PredictionStationNameSpecification(
          'Waterloo',
        );
        expect(
          specification.isSatisfiedBy(_predictions[0]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[1]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[2]),
          isFalse,
        );
        expect(
          specification.isSatisfiedBy(_predictions[3]),
          isFalse,
        );
        expect(
          _predictions.where(specification.isSatisfiedBy).toList(),
          isEmpty,
        );
      });
    });
  });
}
